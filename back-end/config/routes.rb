# For all users (nurses, doctors, patients)
root to: 'home#index' # Homepage

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
resources :nurses

# For doctors
resources :doctors