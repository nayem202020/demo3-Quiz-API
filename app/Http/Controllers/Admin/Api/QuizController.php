<?php


namespace App\Http\Controllers\Admin\Api;


use App\Http\Controllers\Controller;
use App\Http\Resources\QuizResource;
use App\Option;
use App\Question;
use App\Quiz;
use App\Section;
use Illuminate\Http\Request;

class QuizController extends Controller
{

    public function getQuiz()
    {
        return QuizResource::collection(Quiz::all());
    }

    public function getSingleQuiz($id)
    {
        return new QuizResource(Quiz::findOrFail($id));
    }

    public function store(Request $request)
    {
        $req_data = $request->input('quiz');
        $title = $req_data['title'];
        $time = $req_data['time'];
        $mark = $req_data['mark'];
        $quiz = Quiz::create([
            'title' => $title,
            'time' => $time,
            'mark' => $mark,
        ]);

        $sections = $req_data['sections'];

        foreach ($sections as $section) {

            $sectionTitle = $section['sectionTitle'];
            $sectionObj = Section::create([
                'sectionTitle' => $sectionTitle,
                'quiz_id' => $quiz->id,
            ]);

            $questions = $section['questions'];

            foreach ($questions as $question) {
                $questionText = $question['questionText'];
                $questionType = $question['type'];
                $questionRightAnswer = $question['rightAnswer'];

                $questionObj = Question::create([
                    'questionText' => $questionText,
                    'type' => $questionType,
                    'section_id' => $sectionObj->id,
                ]);

                $questionOptions = $question['options'];

                foreach ($questionOptions as $index => $questionOption) {
                    $optionText = $questionOption['optionText'];
                    $correct = 'n';
                    if (in_array($index + 1, $questionRightAnswer)) {
                        $correct = 'y';
                    }
                    $optionObj = Option::create([
                        'optionText' => $optionText,
                        'is_correct' => $correct,
                        'question_id' => $questionObj->id,
                    ]);
                }

            }

        }
        //  return $title . '-' . $time . '-' . $mark . '-' . $quiz->id;
        // return $title . '-' . $time . '-' . $mark;
        return response()->json(['quiz_id' => $quiz->id], 200);
    }
}
