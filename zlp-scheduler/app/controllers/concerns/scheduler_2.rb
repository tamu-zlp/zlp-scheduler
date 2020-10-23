class Scheduler_2
    @days = ["M","T","W","TR","F"]
    
    def self.is_conflict?(day,current_time,schedule)
        schedule.courses.each do |course|
            if course.meeting_days.include? day
                if course.meetingtime_start.in_time_zone(-5).strftime("%H%M") <= current_time.strftime("%H%M") and current_time.strftime("%H%M") <= course.meetingtime_end.in_time_zone(-5).strftime("%H%M")
                    return course
                elsif course.meetingtime_start.in_time_zone(-5).strftime("%H%M") <= current_time.advance(:hours => 2).strftime("%H%M") and current_time.advance(:hours => 2).strftime("%H%M") <= course.meetingtime_end.in_time_zone(-5).strftime("%H%M")
                    return course
                else
                    return false
                end
            else
                return false
            end
            
        end
    end
    
    
    def self.Generate_time_slots(cohort)
        
        @days.each do |day|
            start_of_day = Time.new(2020,12,9,8,0,0)
            end_of_day = Time.new(2020,12,9,15,0,0)
            current_time = start_of_day
            
            while current_time < end_of_day
                @time_slot = TimeSlot.new
                @time_slot.time = current_time
                @total_cost = 0
                @conflict = false
                cohort.users.each do |student|
                    
                    student.schedules.each_with_index do |schedule, index|
                    @conflict = self.is_conflict?(day,current_time,schedule)
                    if @conflict.is_a? false.class
                        break
                    else
                        #print(@conflict)
                        @conflict_mod = Conflict.new
                        @conflict_mod.user = student
                        print(@conflict.id)
                        @conflict_mod.cost = ScheduleToCourse.find_by(:course_id  =>  @conflict.id, :schedule_id => schedule.id).mandatory ? 2**index + 4 : 2 ** index #  schedule.schedule_to_courses.find_by(course_id: @conflict.id)
                        @conflict_mod.course = @conflict
                        @conflict_mod.schedule = schedule
                        @conflict_mod.save
                        @total_cost += @conflict_mod.cost
                        @time_slot.conflicts.push(@conflict_mod)
                    end

                    end
                end
                
                @time_slot.cost = @total_cost
                print(@conflict.class)
                if @conflict.is_a? false.class
                    @time_slot.was_conflict = false
                else
                    print("Set Conflict")
                    @time_slot.was_conflict = true
                end
                @time_slot.day = day
                @time_slot.save
                cohort.time_slots.push(@time_slot)
                cohort.save
                current_time += 60*15
                
            end
        end
        
        # cohort.users.each do |student|
        #     print(student.firstname+"\n")
        #     student.schedules.each do |schedule|
        #         print(schedule.name+"\n")
        #         # print(schedule.courses.where(:abbreviated_subject => "ISEN").first.course_name)
        #         schedule.courses.each do |course|
        #             # Time.parse(course.meetingtime_start)
                    
        #             print(Time.parse(course.meetingtime_end.to_s))
        #             print(course.meeting_days)
        #             print("\n")
        #         end
        #     end
        # end
        
    end
    
end