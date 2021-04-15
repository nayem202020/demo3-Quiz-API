<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    protected $table = 'quizzes';
    protected $fillable = ['title','time', 'mark'];

    public function sections(){

        return $this->hasMany(Section::class,'quiz_id','id');
    }


}
