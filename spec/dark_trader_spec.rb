require_relative("../lib/dark_trader.rb")

describe "the crypto_scrapping method" do
    it "should return scrapped, and scrapped is not nil" do
        expect(crypto_scrapping).not_to be_nil
    end
    it "should return an array of a coherent size" do
        expect(crypto_scrapping.size).to be > 2000
    end
    it "should check if include the famous crypto currencies" do
        expect(crypto_scrapper).to include(hash_including("BTC"=>anything))
    end
end