require_relative '../slot_machine'

describe SlotMachine do
  describe "#push" do
    it "Return 3 random symbols for the slot machine" do
        slot_machine = SlotMachine.new
        result = slot_machine.push
        expect(result.size).to eq(3)
    end
  end

  describe "#score"
   describe "Return the correct score for each type of combination" do
    it "Return 0 for each different symbol" do
      slot_machine = SlotMachine.new
      result = %w[joker star bell]
      result_two = %w[bell cherry star]
      expect(slot_machine.score(result)).to eq(0)
      expect(slot_machine.score(result_two)).to eq(0)
    end
    it "Return the correct for each equal symbol" do
        slot_machine = SlotMachine.new
        result = %w[joker joker joker]
        result_two = %w[bell bell bell]
        expect(slot_machine.score(result)).to eq(50)
        expect(slot_machine.score(result_two)).to eq(30)
      end
   end
   it "Return the correct score for 2 equal + 1 joker" do
      slot_machine = SlotMachine.new
      result = %w[joker joker bell]
      result_two = %w[joker bell bell]
      result_three = %w[joker cherry cherry]
      expect(slot_machine.score(result)).to eq(25)
      expect(slot_machine.score(result_two)).to eq(15)
      expect(slot_machine.score(result_three)).to eq(5)
   end
end