<?php

use Illuminate\Http\Request;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// Quiz List
Route::post('/add_quiz','Admin\Api\QuizController@store')->name('quiz_store');
Route::get('/list_quiz','Admin\Api\QuizController@getQuiz')->name('list_quiz');
Route::get('/single_quiz/{id}','Admin\Api\QuizController@getSingleQuiz')->name('single_quiz');
