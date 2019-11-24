<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pessoa extends Model
{
    protected $table = 'pessoa';
    protected $primaryKey = 'idpessoa';
    public $incrementing = true;

    protected $fillable = [
        'nome', 'cpf',
    ];
}
