class CatRentalRequest < ActiveRecord::Base
  attr_accessible :begin_date, :cat_id, :end_date, :status

  belongs_to :cat

  validate :valid_date, :no_conflict

  def approve
    self.status = "approve"
    self.save!
    other_requests = CatRentalRequest.where(
      "status = 'undecided' AND cat_id = ? AND  (? BETWEEN begin_date and end_date OR ? BETWEEN begin_date and end_date )",
      self.cat_id, self.begin_date, self.end_date)
    other_requests.each do |req|
      req.status = 'denied'
      req.save!
    end
  end

  def valid_date
    errors.add(:base, "invalid time period") if self.begin_date > self.end_date
  end

  def no_conflict
    errors.add(:base, "request already exists") if CatRentalRequest.where(
      "status = 'approved' AND cat_id = ? AND  (? BETWEEN begin_date and end_date OR ? BETWEEN begin_date and end_date )",
      self.cat_id, self.begin_date, self.end_date).any?
  end

end


