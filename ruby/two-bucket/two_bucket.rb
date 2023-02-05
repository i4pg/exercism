# frozen_string_literal: true

# Problem overview https://www.youtube.com/watch?v=0Oef3MHYEC0
class TwoBucket
  attr_reader :buckets, :starter_bucket, :first, :second, :goal, :to_bucket
  attr_accessor :moves

  def initialize(first, second, goal, starter)
    @first = Bucket.new(size: first)
    @second = Bucket.new(size: second)
    @buckets = [@first, @second]
    @goal = goal
    @moves = 0
    which_starter(bucket: starter)
    fill_starter_bkt
    main
  end

  def goal_bucket
    bucket_goal == first ? 'one' : 'two'
  end

  def other_bucket
    goal_bucket == 'one' ? second.liters : first.liters
  end

  private

  def +@
    @moves += 1
  end

  def goal_reached?
    bucket_goal || false
  end

  def goal_eql_size?
    goal_eql_size || false
  end

  def fill_starter_bkt
    fill(bucket: starter_bucket)
  end

  def still_transforing?(to:)
    !goal_reached? && to.full?
  end

  def empty(bucket:)
    bucket.liters = 0
    +self
  end

  def fill(bucket:)
    bucket.liters = bucket.size
    +self
  end

  def pour(from:, to:)
    return if from.empty? || to.full?

    pouring(from: from, to: to)
    +self
  end

  def pouring(from:, to:)
    until from.empty? || to.full?
      -from
      +to
    end
  end

  def bucket_goal
    buckets.find { |bucket| bucket.liters == goal }
  end

  def goal_eql_size
    buckets.find { |bucket| bucket.size == goal }
  end

  def which_starter(bucket:)
    @starter_bucket = bucket == 'one' ? @first : @second
    @to_bucket = bucket == 'one' ? @second : @first
  end

  def small_transforing(from:, to:)
    empty(bucket: to)
    pour(from: from, to: to)
  end

  def small_to_large(from:, to:)
    pour(from: from, to: to)
    small_transforing(from: from, to: to) if still_transforing?(to: to)
    fill(bucket: from) unless goal_reached?
  end

  def large_to_small(from:, to:)
    pour(from: from, to: to)
    empty(bucket: to)
    pour(from: from, to: to)
    fill(bucket: from) if from.empty?
  end

  def transfer_fluid
    until goal_reached?
      if starter_bucket < to_bucket
        small_to_large(from: starter_bucket, to: to_bucket)
      else
        large_to_small(from: starter_bucket, to: to_bucket)
      end
    end
  end

  def main
    if goal_eql_size?
      fill(bucket: goal_eql_size) unless goal_reached?
    else
      transfer_fluid
    end
  end
end

# bucket
class Bucket
  include Comparable
  attr_reader :size
  attr_accessor :liters

  def initialize(size:)
    @size = size
    @liters = 0
  end

  def full?
    size == liters
  end

  def empty?
    liters.zero?
  end

  def has_some_fluid?
    !empty? && !full?
  end

  # Compare buckets by size as default
  def <=>(other)
    size <=> other.size
  end

  def +@
    @liters += 1
  end

  def -@
    @liters -= 1
  end
end
