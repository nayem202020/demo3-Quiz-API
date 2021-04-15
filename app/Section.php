<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
    protected $table = 'sections';
    protected $fillable = ['sectionTitle','quiz_id'];

    public function questions(){

        return $this->hasMany(Question::class,'section_id','id');
    }
}
