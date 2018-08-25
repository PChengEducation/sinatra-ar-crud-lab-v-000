ActiveRecord::Schema.define(version: 20160325152704) do

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "content"
  end

end
