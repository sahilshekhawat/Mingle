module ApplicationHelper
	 def get_current_cycle_request
    cycles = CycleIssuRequest.all
    cycles.each do |c|
      if c.studentid == current_user.id && c.to > Time.now
        return c
      end
    end
    return nil
  end
  def get_previous_rides
    cycles = CycleIssuRequest.all
    c1 = []
    cycles.each do |c|
      if c.studentid == current_user.id && c.to < Time.now
        c1 << c
      end
    end
    return c1
  end
  def count_used_rides
    cycles = CycleIssuRequest.all
    c1 = []
    cycles.each do |c|
      if c.to > Time.now
        c1 << c
      end
    end
    return c1.count
  end
   def total_cycles
    10
  end
end
