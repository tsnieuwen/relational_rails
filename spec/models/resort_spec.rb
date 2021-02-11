require 'rails_helper'

describe Resort do
  describe Resort, type: :model do
    describe 'relationships' do
      it { should have_many :customers }
    end
  end
end
