require_relative("../lib/dear_deputies.rb")

describe "the get_deputy_infos method" do
  uri = "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"

  it "should return a hash" do
    expect(deputies_infos_hash.class).to be == Hash
  end

  it "should provide correct informations for known deputy (! please update information before running the test)" do
    expect(deputies_infos_hash).to be == { "first_name" => "Damien", "last_name" => "Abad", "email" => "damien.abad@assemblee-nationale.fr" }
  end
end