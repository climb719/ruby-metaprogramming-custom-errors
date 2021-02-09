class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  # def get_married(person)
  #   self.partner = person
  #   person.partner = self
  # end

  # def get_married(person)
  #   self.partner = person
  #   if person.class != Person
  #     raise PartnerError
  #   else
  #     person.partner = self
  #   end
  # end

#   The basic pattern of error rescuing is as follows:

# begin
#   raise YourCustomError
# rescue YourCustomError
# end

  def get_married(person)
    self.partner = person
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
          puts error.message
      end
    else
      person.partner = self
    end
end 

  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end 

end

# If the object passed into the method as an argument is not an instance of the 
# Person class, we will begin our error handling. First, we raise our PartnerError, 
# then we rescue our PartnerError. The rescue method creates an instance of the 
# PartnerError class and puts out the result of calling message on that instance.

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




