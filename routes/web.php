<?php


Route::get('/', function () {
    return view('welcome');
});


Route::get('/clear', function () {

    //Artisan::call("storage:link");
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    Artisan::call('config:cache');
    Artisan::call('config:clear');

    echo "Success";
});
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/{any}', 'Admin\AdminController@index')->name('dashboard');
