<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $donor=1;
        $recipient=2;
        $village=1;
        $house=1;

        $this->call(AccountsTableSeeder::class);
        $this->call(BanksTableSeeder::class);
        factory(\App\Blood::class, 1)->create();
        $this->call(BloodsTableSeeder::class);
        factory(\App\Mode::class, 1)->create();
        $this->call(ModesTableSeeder::class);
        factory(\App\Fund::class, 1)->create();
        $this->call(FundsTableSeeder::class);
        factory(\App\Religion::class, 1)->create();
        $this->call(ReligionsTableSeeder::class);
        factory(\App\ExpenseType::class, 1)->create();
        $this->call(ExpenseTypesTableSeeder::class);
        factory(\App\Designation::class, 1)->create();
        $this->call(DesignationsTableSeeder::class);
        factory(\App\Note::class, 1)->create();
        $this->call(NotesTableSeeder::class);
        factory(\App\Collection::class, 50)->create();
        $this->call(ComplainTypesTableSeeder::class);
        factory(\App\ComplainType::class, 5)->create();
        factory(\App\District::class, 65)->create();
        factory(\App\Upazila::class, 500)->create();
        factory(\App\Union::class, 500)->create();

        factory(\App\Village::class, $village)->create();
        factory(\App\House::class, $house)->create();

        $this->call(OrganizersTableSeeder::class);
        factory(\App\Organizer::class, 5)->create();
        factory(\App\Campaign::class, 5)->create();
        factory(\App\CashOut::class, 100)->create();
        factory(\App\Role::class, 1)->create();
        $this->call(RolesTableSeeder::class);
        factory(\App\Mosque::class, 100)->create();
        $this->call(DonorsTableSeeder::class);

        factory(\App\Donor::class, $donor)->create();

        factory(\App\Complain::class, 100)->create();
        $this->call(RecipientTypesTableSeeder::class);

        factory(\App\Recipient::class, $recipient)->create();

        factory(\App\Transaction::class, 87)->create();
        factory(\App\Project::class, 100)->create();
        $this->call(ProjectsTableSeeder::class);
        factory(\App\DonorTransaction::class, 100)->create();
        factory(\App\Donation::class, 100)->create();
        factory(\App\Office::class, 5)->create();
        factory(\App\Expense::class, 5)->create();
        factory(\App\Gallery::class, 5)->create();
        factory(\App\Memo::class, 5)->create();
        factory(\App\Message::class, 10)->create();
        factory(\App\Receipt::class, 5)->create();
        factory(\App\Report::class, 5)->create();
        factory(\App\Sponsor::class, 5)->create();
        factory(\App\User::class, 10)->create();
        $this->call(UsersTableSeeder::class);
        factory(\App\Work::class, 5)->create();

    }
}
