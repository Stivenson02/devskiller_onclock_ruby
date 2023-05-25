# Created INs
Event.find_or_create_by!(employee_id: "1", timestamp: ('01/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "1", timestamp: ('02/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "1", timestamp: ('03/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "1", timestamp: ('04/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('01/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('02/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('03/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('04/01/2023 08:00').to_time)

# Created OUTs
Event.find_or_create_by!(employee_id: "1", timestamp: ('01/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "1", timestamp: ('02/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "1", timestamp: ('03/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "2", timestamp: ('01/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "2", timestamp: ('02/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "2", timestamp: ('03/01/2023 16:00').to_time, kind: :out)
Event.find_or_create_by!(employee_id: "2", timestamp: ('04/01/2023 16:00').to_time, kind: :out)

# Created Erros
Event.find_or_create_by!(employee_id: "1", timestamp: ('05/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "1", timestamp: ('06/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('05/01/2023 08:00').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('07/01/2023 16:00').to_time, kind: :out)

# Created NOT Erros
Event.find_or_create_by!(employee_id: "1", timestamp: ('04/01/2023 08:01').to_time)
Event.find_or_create_by!(employee_id: "2", timestamp: ('01/01/2023 08:01').to_time)


