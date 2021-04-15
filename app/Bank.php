<?php

namespace App;

use App\Http\Resources\BankResource;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;

class Bank extends Model
{
    use SoftDeletes;
    protected $table = 'banks';
    protected $fillable = ['name','details', 'status', 'locked'];

    public static function storeValidation(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:banks,name',
            'bank_details' => 'required|max:500',
        ],[
            'name.required' => 'Please enter account name.',
            'name.unique' => 'This account number already registered.',
            'bank_details.required' => 'Please enter bank details.',
        ]);
    }

    public static function updateValidation(Request $request,$id)
    {
        $request->validate([
            'name' => 'required|unique:banks,name,'.$id,
            'bank_details' => 'required|max:500',
        ],[
            'name.required' => 'Please enter account name.',
            'name.unique' => 'This account number already registered.',
            'bank_details.required' => 'Please enter bank details.',
        ]);
    }

    public static function dbStore(Request $request)
    {
        $db = Self::create([
            'name' => $request->name ? $request->name : 'empty',
            'details' => $request->bank_details ? $request->bank_details : 'empty',
            'status' => $request->publication_status ? 1 : 0,
            'locked' => $request->locke_status ? 1 : 0,
        ]);
        return new BankResource($db);
    }

    public static function dbUpdate(Request $request,$id)
    {
        $db = Self::findOrfail($id);
        $db->name = $request->name ? $request->name : 'empty';
        $db->details = $request->bank_details ? $request->bank_details : 'empty';
        $db->status = $request->publication_status?1:0;
        $db->locked =$request->locke_status?1:0;
        $db->save();
        return new BankResource($db);
    }
}
