class ImportService
  class << self
    def import_households(file, current_user)
      ward = current_user.quorum_member.quorum.ward
      CSV.foreach(file.path, headers: true) do |row|
        # TODO: Include address
        import_household(row['Name'], ward)
      end
    end

    def import_household(name, ward)
      Household.find_or_create_by(name: name, ward: ward)
    end

    def import_assignments(file, current_user)
      quorum = current_user.quorum_member.quorum
      CSV.foreach(file.path, headers: true) do |row|
        quorum_member = import_quorum_member(row['Home Teacher'], quorum)
        companion = import_quorum_member(row['Companion'], quorum)
        ['Family 1', 'Family 2', 'Family 3'].each do |column|
          family_name = row[column]
          next unless family_name.present?
          household = import_household(family_name, quorum.ward)
          Assignment.find_or_create_by(household: household, quorum_member: quorum_member, assignment_type: Assignment::Type::PRIMARY)
          Assignment.find_or_create_by(household: household, quorum_member: companion, assignment_type: Assignment::Type::PRIMARY) if companion
        end
      end
    end

    def import_quorum_member(full_name, quorum)
      return nil unless full_name.present?
      names = names(full_name)
      household = import_household(full_name, quorum.ward)
      QuorumMember.find_or_create_by( # Assume LastName, FirstName
        first_name: names.last,
        last_name: names.first,
        quorum_id: quorum.id,
        household_id: household.id)
    end

    def names(full_name)
      return nil unless full_name.present?
      full_name.gsub(',', ' ').squish.split(' ')
    end
  end
end
