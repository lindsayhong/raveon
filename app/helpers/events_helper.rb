module EventsHelper
	def find_event_name(event_id)
		Event.find(event_id).event_name
	end

	def find_event_date(event_id)
		Event.find(event_id).start_date
	end
end
