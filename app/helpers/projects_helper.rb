module ProjectsHelper

  def priority_name(i)
    case i
      when 0
        "Wysoki"
      when 1
        "Normalny"
      else
        "Niski"
    end
  end

  def status_name(i)
    case i
      when 0
        "Wstrzymany"
      when 1
        "W trakcie realizacji"
      when 2
        "Zakończony"
      else
        "Nie rozpoczęty"
    end
  end
end
