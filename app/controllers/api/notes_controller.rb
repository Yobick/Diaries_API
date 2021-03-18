module Api

  class NotesController < ApplicationController

    def index
      note = Note.all
      render json: note, status: 200
    end

    def show
      note = Note.find(params[:id])
      if note
        render json: note, status: :ok
      else
        render json: {errors: note.errors},  status: :unprocessable_entity
      end
    end

    def create
      note = Note.new(n_params)
      if note.save
        render json: note, status: 201
      else
        render json: {errors: note.errors}, status: :unprocessable_entity
      end
    end

    def update
      note = Note.find(params[:id])
      if note.update(d_params)
        render json: note, status: 200
      else
        render json: {errors: note.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      note = Note.find(params[:id])
      if note.delete
        render json: note, status: 200
      else
        render json: {errors: note.errors}, status: :unprocessable_entity
      end
    end

    private

    def n_params
      params.require(:note).permit(:text, :diary_id)
    end
  end
end
