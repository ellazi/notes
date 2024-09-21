class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = set_note
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to note_path(@note)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = set_note
  end

  def update
    @note = set_note
    @note.update(note_params)
    redirect_to note_path(@note)
  end

  def destroy
    @note = set_note
    @note.destroy
    redirect_to notes_path, notice: "Note was successfully deleted"
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
