class Enemy < ApplicationRecord
  after_initialize :init
  validates_presence_of :name, :power_base, :power_step, :level, :kind

  enum kind: [:goblin, :orc, :demon, :dragon]

  def current_power
    power_base + ((level - 1) * power_step)
  end

  def title
    "#{name} ##{level}"
  end

  private

  def init
    self.level ||= 1
    self.power_base ||= 1000
    self.power_step ||= 100
  end
end
