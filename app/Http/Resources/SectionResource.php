<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SectionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

        $qus=[];
        foreach ($this->questions as $key=>$question){
            $key=$key+1;
            $answer = [];
            $options = [];
            $index = '';
            foreach ($question->options as $i => $item) {
                switch ($i) {
                    case 0:
                        $index = 'a';
                        break;
                    case 1:
                        $index = 'b';
                        break;
                    case 2:
                        $index = 'c';
                        break;
                    case 3:
                        $index = 'd';
                        break;
                    case 4:
                        $index = 'e';
                        break;
                    default:
                        $index = $i+1;
                }
                $options[$index] = $item->optionText;
                if ($item->is_correct === 'y'){
                    array_push($answer,$index);
                }
            }
            $qus['q'.$key]= [
                'question'=> $question->questionText,
                'type'=> $question->type,
                'options'=> $options,
                'answer' => $answer,
            ];
        }
        return $qus;
    }
}
