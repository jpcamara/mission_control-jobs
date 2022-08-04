require "test_helper"

class ActiveJob::QueueAdapters::ResqueTest < ActiveSupport::TestCase
  setup do
    ApplicationJob.queue_adapter = :resque
  end

  test "fetch the list of queues" do
    DynamicQueueJob("queue_1").perform_later
    DynamicQueueJob("queue_2").perform_later

    pp Resque.queues
  end
end
