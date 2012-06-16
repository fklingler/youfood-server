class Api::DeviceController < Api::ApiController
  def register
    current_device.registration_id = params[:registration_id]

    if current_device.save
      status = 201
    else
      status = 500
    end

    render :nothing => true, :status => status
  end
end
