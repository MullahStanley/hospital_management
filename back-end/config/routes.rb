Rails.application.routes.draw do
    # For all users (nurses, doctors, patients)
    root to: 'home#index' # Homepage

    #For appointments
    post '/patients', to: 'patients#create'
    post '/login', to: 'patients#login'
    get '/appointments', to: 'appointments#index'
    post '/appointments', to: 'appointments#create'
    put '/appointments/:id', to: 'appointments#update'
    delete '/appointments/:id', to: 'appointments#destroy'

    # For patients

    # Register a patient with a nurse of their choice
    post '/register', to: 'patients#register'

    # Login after signing up
    post '/login', to: 'patients#login' 

    # Display a list of all patient's appointments
    get '/appointments', to: 'patients#appointments' 

    # Book an appointment with a preferred practitioner
    post '/appointments', to: 'patients#create_appointment' 

    # Delete a listed appointment
    delete '/appointments/:id', to: 'patients#delete_appointment' 

    # Logout of the session
    delete '/logout', to: 'sessions#logout' 

    # For nurses
    
    # Login
    post '/nurses/login', to: 'nurses#login'        

    # List nurse's appointments
    get '/nurses/appointments', to: 'nurses#appointments'   

    # Create an appointment
    post '/nurses/appointments', to: 'nurses#create_appointment'

    # Update an appointment
    put '/nurses/appointments/:id', to: 'nurses#update_appointment'

    # Delete an appointment
    delete '/nurses/appointments/:id', to: 'nurses#destroy_appointment'

    # Contact a patient
    post '/nurses/contact_patient/:id', to: 'nurses#contact_patient'     

    # Access patient's medical data
    get '/nurses/patient/:patient_id/medical_data', to: 'nurses#access_medical_data'   

    # For doctors

    # Login
    post '/doctors/login', to: 'doctors#login'

    # List doctor's appointments
    get '/doctors/appointments', to: 'doctors#appointments'

    # Create an appointment
    post '/doctors/appointments', to: 'doctors#create_appointment'  
    
    # Update an appointment
    put '/doctors/appointments/:id', to: 'doctors#update_appointment' 
    
    # Delete an appointment
    delete '/doctors/appointments/:id', to: 'doctors#destroy_appointment'  

    # Contact a patient
    post '/doctors/contact_patient/:id', to: 'doctors#contact_patient' 

    # Access patient's medical data
    get '/doctors/patient/:patient_id/medical_data', to: 'doctors#access_medical_data'   


  end
  