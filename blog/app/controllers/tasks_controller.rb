class TasksController < ApplicationController

  # Función para listar todas las tareas
  def index 
    @tasks = Task.all  # Obtener todas las tareas de la base de datos 
  end

  # Función para mostrar el formulario de nueva tarea
  def new 
    @task = Task.new  # Inicializa una nueva tarea
  end

  # Función para crear una nueva tarea
  def create
    @task = Task.new(task_params)  # Crea una nueva tarea con los parámetros permitidos
    if @task.save  # Guarda la tarea en la base de datos
      redirect_to tasks_path, notice: "Tarea creada con éxito"
    else
      render :new  # Si hay errores, vuelve a mostrar el formulario
    end
  end
  
  # Función para editar una tarea existente
  def edit
    @task = Task.find(params[:id])  # Busca la tarea por su ID
  end

  # Función para actualizar una tarea
  def update
    @task = Task.find(params[:id])  # Busca la tarea por su ID
    if @task.update(task_params)  # Intenta actualizarla con los nuevos datos
      redirect_to tasks_path, notice: "Tarea actualizada"
    else
      render :edit  # Si hay errores, vuelve a mostrar el formulario de edición
    end
  end
  
  # Función para eliminar una tarea
  def destroy
    @task = Task.find(params[:id])  # Busca la tarea por su ID
    @task.destroy  # La elimina de la base de datos
    redirect_to tasks_path, notice: "Tarea eliminada"
  end
  
  # Función para definir los parámetros permitidos
  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end

end
