class InstructorsController < ApplicationController

    def create
        instructor = Instructor.create(instructor_params)
        if instructor.valid?
            render json: instructor, status: :created
        else
            render json: { errors: instructor.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        instructor = Instructor.find(params[:id])
        if instructor
            render json: instructor
        else
            render json: { error: "instructor not found" }, status: :not_found
        end
    end

    def index
        instructors = Instructor.all 
        render json: instructors
    end

    def update
        instructor = Instructor.find(params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor, status: :accepted
        else
            render json: { error: "instructor not found" }, status: :not_found
        end
    end

    def destroy
        instructor = Instructor.find(params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: { error: "instructor not found" }, status: :not_found
        end
    end

    private

    def instructor_params
        params.permit(:name)
    end

end
