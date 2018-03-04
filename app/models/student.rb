class Student < ActiveRecord::Base
	has_and_belongs_to_many :groups
	has_and_belongs_to_many :exams
	has_many :assessments

	def name
		"#{lastname}, #{firstname}"
	end

	def total_proper(course, limit=Time.now)
		max = -100
		Student.all.where('matrnr = ? OR (firstname = ? AND lastname = ?)', matrnr, firstname, lastname).each do |s|
			value = s.total(course, limit)
			if value > max
				max = value
			end
		end

		max
	end

	def total(course, limit=Time.now)
		groups = course.groups.pluck(:id)
		weeks = course.weeks.where("start <= Datetime(?)", limit).pluck(:id)
		weekAssessments = assessments.where("group_id in (?) and week_id in (?)", groups, weeks)
		value = -(weeks.length - weekAssessments.length);
		weekAssessments.each { |a| value += a.value }
		value
	end
end
