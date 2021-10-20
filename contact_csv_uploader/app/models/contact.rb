require 'csv'

class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :csv_file

  validates :name,
            :birthday,
            :phone,
            :address,
            :franchise,
            :email,
            :card_number,
            presence: true

  def self.import(file, user)
    contact_file = CsvFile.new log: 'Uploading file..',
                               status: 'Processing'
    contacts_saved = 0
    CSV.foreach(file.path, headers: true) do |row|
      line_parsed = row.to_hash.merge!(user_id: user.id,
                                       csv_file_id: contact_file.id)
      contact = Contact.new line_parsed
      if contact.valid?
        contact.save
        contacts_saved += 1 if contacts_saved.zero?
      else
        errors = contact.errors.full_messages.join(', ')
        contact_file_log = contact_file.log
        contact_file.update(
          log: contact_file_log.concat(row.to_s.concat("\n#{errors}")),
          status: 'Failed'
        )
      end
    end

    return unless contacts_saved.positive?

    contact_file.update(status: 'Finished')
  end
end
