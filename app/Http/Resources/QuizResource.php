<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class QuizResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $sectionData = [];
        foreach ($this->sections as $key => $section) {
            $sectionData[$section->sectionTitle] = SectionResource::make($section);

        }
        return [
            'quiz' => $sectionData,
            'id' => $this->id,
            'title' => $this->title,
            'time' => $this->time,
            'total_mark' => $this->mark,
        ];
    }

}
