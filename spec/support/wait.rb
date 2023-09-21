##
# This method waits for a job if a job is enqueued asynchronously
# e.g. via the MessageBus gem.
#
# @param job_class [Class] The job class to wait for.
def wait_for_job(job_class)
  wait_for(
    lambda do
      (ActiveJob::Base.queue_adapter.enqueued_jobs.select { |job| job[:job] == job_class }).empty?
    end,
  )
end

##
# Wait for a proc to be true in order to wait for
# asynchronous code to be executed.
#
# It will wait for a maximum of 1 second.
#
# @param proc [Proc] The proc to wait for.
def wait_for(proc)
  # Do an initial sleep to allow for other code to be executed.
  sleep 0.001

  x = 0
  while proc.call
    x += 1
    break if x > 1000

    sleep 0.001
  end
end
