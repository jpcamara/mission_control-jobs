module ActiveJob::QueueAdapters::SolidQueueExt::Batches
  def supports_batches?
    true
  end

  def batches
    batches = SolidQueue::JobBatch.all
    batches.collect do |batch|
      batch_attributes_from_solid_queue_batch(batch)
    end
  end

  def find_batch(batch_id)
    if batch = SolidQueue::JobBatch.find_by(id: batch_id)
      batch_attributes_from_solid_queue_batch(batch)
    end
  end

  private
    def batch_attributes_from_solid_queue_batch(batch)
      {
        id: batch.id
        # job_class_name: batch.class_name,
        # command: batch.command,
        # arguments: batch.arguments,
        # schedule: batch.schedule,
        # queue_name: batch.queue_name,
        # priority: batch.priority
      }
    end
end
