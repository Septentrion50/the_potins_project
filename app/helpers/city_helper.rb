module CityHelper
  def exists?(city_name)
    return true if City.find_by(name: city_name.downcase)

    false
  end

  def find_city(name)
    City.find_by(name: name)
  end

  def create_city(name, zip_code)
    City.create(name: name.downcase, zip_code: zip_code.downcase)
  end
end
