module ApplicationHelper

  def time minute, hour
    str = "TIME: "
    minute = 0 if minute.blank?
    if hour.blank?
      str << "unavailable"
    else
      str << format("%02d:%02d", hour, minute)
    end
  end

  def date day, month, year
    str = "DATE: "
    if !year.blank?
      if !month.blank?
        if !day.blank?
          str << Date.new(year,month,day).strftime("%A, %B %d, %Y").to_s
        else
          str << Date.new(year,month).strftime("%B, %Y").to_s
        end
      else
        str << Date.new(year).strftime("%Y").to_s
      end
    else
      str << "unavailable"
    end
  end

  def usgs_id id
    if id.blank?
      ""
    else
      "#" + id.to_s
    end
  end

  def location place, country
    str = "LOCATION: "
    str << (place + ", ") unless place.blank?
    str << (country) unless country.blank?
    return str
  end

  def latlng lat, lng
    str = "COORDINATES: "
    if lat && lng
      str << lat.to_s + "˚N, "
      str << lng.to_s + "˚E"
    else
      str << "unavailable"
    end
  end

  def depth d
    str = "DEPTH: "
    if d
      # TODO check if actually kilometers
      str << d.to_s + "km"
    else
      str << "unavailable"
    end
  end

  def elevation e
    str = "ELEVATION: "
    if e
      str << e.to_s + "m"
    else
      str << "unavailable"
    end
  end

  def volcano v
    str = "TYPE: "
    if v
      str << v.to_s
    else
      str << "unavailable"
    end
  end

  def magnitude mag
    str = "MAGNITUDE: "
    if mag.blank?
      str << "unavailable"
    else
      str << mag.to_s
    end
  end

  def vei v
    str = "VEI: "
    if v.blank?
      str << "unavailable"
    else
      str << v.to_s
    end
  end

  def eruptionName name
    if name.blank?
      "unnamed eruption"
    else
      "Eruption: " + name
    end
  end

end
