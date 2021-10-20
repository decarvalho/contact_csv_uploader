# README

Ruby version: ruby 2.6.6p146
Rails version: Rails 6.1.4.1

Create user: rails db:seed

CSV Files for testing:
1 - contact_csv_uploader/first_csv_sample.csv - There are no issues
2 - contact_csv_uploader/second_csv_sample.csv - There are no issues
3 - contact_csv_uploader/third_csv_sample.csv - Missing first contact's name
4 - contact_csv_uploader/forth_csv_sample.csv - Missing all contact's name

URLs:
/csv_files - List of files importes
/contacts - List of imported contacts
/contacts/new - Where user can import new contacts

Missing field requirement validations, spec tests and asynchronous processing.