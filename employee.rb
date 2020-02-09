#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

class Employee
	
	attr_reader :name

=begin
多行注释的方法
Ruby 提供了四种类型的变量：
    局部变量：局部变量是在方法中定义的变量。局部变量在方法外是不可用的。局部变量以小写字母或 _ 开始。
    实例变量：实例变量可以跨任何特定的实例或对象中的方法使用。这意味着，实例变量可以从对象到对象的改变。实例变量在变量名之前放置符号（@）。
    类变量：类变量可以跨不同的对象使用。类变量属于类，且是类的一个属性。类变量在变量名之前放置符号（@@）。
    全局变量：类变量不能跨类使用。如果您想要有一个可以跨类使用的变量，您需要定义全局变量。全局变量总是以美元符号（$）开始。
=end	

	def name=(name)
		if name == ""
			raise "Name can't be blank!"
		end
		@name = name
	end
	
	def initialize(name = "Anonymous")
		self.name = name
	end
	
	def print_name
		puts "Name: #{name}"
	end
	
end

class SalariedEmployee < Employee
	
	attr_reader :salary
	
	def salary=(salary)
		if salary < 0
			raise "A salary of #{salary} isn't valid!"
		end
		@salary = salary
	end
	
	def initialize(name = "Anonymous", salary = 0.0)
		super(name)
		self.salary = salary
	end
	
	def print_pay_stub
		print_name
		pay_for_period = (salary/365.0)*14
		formatted_pay = format("$%.2f",pay_for_period)
		puts "Pay SalariedEmployee Period: #{formatted_pay}"
	end
	
end

class HourlyEmployee < Employee
	
	def self.security_guard(name)
		HourlyEmployee.new(name, 19.25, 30)
	end
	def self.cashier(name)
		HourlyEmployee.new(name, 12.75, 25)
	end
	def self.janitor(name)
		HourlyEmployee.new(name,10.50,20)
	end
	
	attr_reader :hourly_wage, :hours_per_week
	
	def hourly_wage=(hourly_wage)
		if hourly_wage < 0
			raise "An hourly wage of #{hourly_wage} isn't valid!"
		end
		@hourly_wage = hourly_wage
	end
	
	def hours_per_week=(hours_per_week)
		if hours_per_week < 0
			raise "#{hours_per_week} hours per week isn't valid!"
		end
		@hours_per_week = hours_per_week
	end
	
	def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
		super(name)
		self.hourly_wage = hourly_wage
		self.hours_per_week = hours_per_week
	end
	
	def print_pay_stub
		print_name
		pay_for_period = hourly_wage * hours_per_week * 2
		formatted_pay = format("$%.2f", pay_for_period)
		puts "Pay HourlyEmployee Period:#{formatted_pay}"
	end
end

jane = SalariedEmployee.new("Jane Doe", 50000)
jane.print_pay_stub

angela = HourlyEmployee.security_guard("Angela Mattews")
ivan = HourlyEmployee.cashier("Ivan Stokes")
angela.print_pay_stub
ivan.print_pay_stub