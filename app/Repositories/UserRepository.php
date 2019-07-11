<?php

namespace App\Repositories;
use App\User;

use App\Services\Constants\AppErrorCodes;
use App\Services\Constants\AppConstants;

class UserRepository
{
    public function getAll()
    {
        return User::paginate(10);
    }

    public function create($input)
    {
        return User::create($input);
    }

    public function update($input, $id)
    {
        return User::where('id', $id)->update($input);
    }

    public function getById($id)
    {
        return User::where('id', $id)->first();
    }

  
}
