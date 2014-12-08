class AddFieldsToKid < ActiveRecord::Migration
  def change
    add_column :kids, :motherFirstName, :string
    add_column :kids, :motherLastName, :string
    add_column :kids, :fatherFirstName, :string
    add_column :kids, :fatherLastName, :string
    add_column :kids, :address, :string
    add_column :kids, :phone, :string
    add_column :kids, :email, :string
    add_column :kids, :likings, :text
    add_column :kids, :badHabbits, :text
    add_column :kids, :words, :text
    add_column :kids, :specificFood, :string
    add_column :kids, :allergies, :string
    add_column :kids, :other, :text
  end
end
