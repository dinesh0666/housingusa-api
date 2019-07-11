<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Services\Transformers;

use League\Fractal\Resource\Collection;
use League\Fractal\Resource\Item;
use League\Fractal\Manager;
use League\Fractal\Serializer\ArraySerializer;
use League\Fractal\Pagination\IlluminatePaginatorAdapter;

/**
 * Description of BaseTransformer.
 *
 * @author suresh
 */
class BaseTransformer
{
    protected $incldues;
    /**
     * Generates a Fractal Item response.
     *
     * @param object $item     Resource to be converted
     * @param object $callback Resource Transformer
     *
     * @return \League\Fractal\Reource\Item
     */
    protected function respondWithItem($item, $callback, $key = null)
    {
        $resource = new Item($item, $callback, $key);
        $transformedResource = $this->transform($resource);

        return $this->attachKeyToTransformedResource($key, $transformedResource);
    }

    /**
     * Generates a Fractal Collection response.
     *
     * @param object $item     Resource to be converted
     * @param object $callback Resource Transformer
     *
     * @return \League\Fractal\Reource\Collection
     */
    protected function respondWithCollection($collection, $callback, $key = null)
    {
        $resource = new Collection($collection->getCollection(), $callback);
        $resource->setPaginator(new IlluminatePaginatorAdapter($collection));
        $transformedResource = $this->transform($resource);

        return $this->attachKeyToTransformedResource($key, $transformedResource);
    }
    public function attachKeyToTransformedResource($key, $transformedResource)
    {
        $returnArray = [];
        if ($key) {
            $returnArray[$key] = $transformedResource;
        } else {
            $returnArray = $transformedResource;
        }

        return $returnArray;
    }
    /**
     * Transforms the response into array.
     *
     * @param League\Fractal\Resource $data
     *
     * @return League\Fractal\Manager
     */
    protected function transform($data)
    {
        $fractalManager = new Manager();
        $manager = $this->applyIncludes($fractalManager);
        $this->resetIncldues();
        $manager->setSerializer(new ArraySerializer());

        return $manager->createData($data)->toArray();
    }

    protected function resetIncldues()
    {
        $this->incldues = [];
    }

    protected function setIncludes($includes)
    {
        $this->incldues = $includes;
    }

    protected function applyIncludes($fractalManager)
    {
        if ($this->request->has('include')) {
            $fractalManager->parseIncludes($this->request->get('include'));
        }
        if (count($this->incldues) > 0) {
            $fractalManager->parseIncludes(implode(',', $this->incldues));
        }

        return $fractalManager;
    }
}
