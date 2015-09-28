class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :endtime
      t.integer :cost
      t.boolean :show_register_link
      t.boolean :show_donate_link
      t.boolean :childcare_available

      t.timestamps null: false
    end
  end
end
