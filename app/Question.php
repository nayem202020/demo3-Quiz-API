<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';
    protected $fillable = ['questionText','type','section_id'];

    public function options(){

        return $this->hasMany(Option::class,'question_id','id');
    }
}
