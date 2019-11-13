class NotesController < ApplicationController
  before_filter :get_person
  #copy & adjust language from person_controller as applicable
  #THEN update Notes>Html pages (can use content from Pages>html)
  def index
    @notes = Note.all
  end

  def edit
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
    if @person.update(person_params)
      redirect_to person_path(@person.id)
    else
      render: edit
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = @person.notes.build
  end

  def create
    @note = Note.new(note_params)
    @note.person_id = params[:person_id]
    if @note.save 
      redirect_to person_path(@note.person_id)
    else
      render :new
  end

  def destroy
    Note.find(params[:id])
    .destroy
    redirect_to people_path
  end

  def get_person
    @oerson = Person.find(params[:id])
  end

  private
  def note_params
    params.require(:body)
  end

end

