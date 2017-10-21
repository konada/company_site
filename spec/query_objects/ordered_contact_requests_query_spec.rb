require "rails_helper"

describe OrderedContactRequestsQuery do
  describe "#by_author" do
    before do
      create :contact_request, name: "Zenon Martyniuk", created_at: Time.now - 2.days
      create :contact_request, name: "Lech Wałęsa", created_at: Time.now - 1.days
      create :contact_request, name: "Adam Małysz"
    end

    it "ascending - returns first element alphabeticaly by author" do
      params = { sort_by: "by_author", direction: "asc" }
            query = described_class.new(params).all

            expect(query.first.name).to eq("Adam Małysz")
          end

     it "descending - returns last element alphabeticaly by author" do
      params = { sort_by: "by_author", direction: "desc" }
      query = described_class.new(params).all

      expect(query.first.name).to eq("Zenon Martyniuk")
    end
  end
end
