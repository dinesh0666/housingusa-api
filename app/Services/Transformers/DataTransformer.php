<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Services\Transformers;

use Illuminate\Http\Request;

/**
 * Description of DataTransformer.
 *
 * @author Suresh
 */
class DataTransformer extends BaseTransformer
{
    /**
     * @var Request
     */
    protected $request;

    /**
     * @var \Illuminate\Support\Collection
     */
    private $collectionToTransform;


    public function __construct(Request $request)
    {
        $this->collectionToTransform = [];
        $this->request = $request;
        $this->incldues = [];
    }
    public function addData($data, $transformer, $dataType = 'item', $key = null, $includes = [])
    {
        $this->setIncludes($includes);
        switch ($dataType) {
            case 'item':
                $transformedData = $this->respondWithItem($data, $transformer, $key);
                break;
            case 'collection':
                $transformedData = $this->respondWithCollection($data, $transformer, $key);
                break;
        }
        $this->collectionToTransform = array_merge($this->collectionToTransform, $transformedData);
    }

    public function getTransformedData()
    {
        return $this->collectionToTransform;
    }
}
