ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :alphas do |t|
    t.string :alpha_a
    t.string :alpha_b
    t.integer :alpha_id
    t.integer :beta_id
  end

  create_table :betas do |t|
    t.string :beta_a
    t.string :beta_b
  end

  create_table :gammas do |t|
    t.string :role
  end

  # default Rails 4 beta1 scaffold generated model
  create_table :deltas do |t|
    t.string :name
    t.string :title
    t.text :content

    t.timestamps
  end
end
