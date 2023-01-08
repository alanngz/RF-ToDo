using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using ToDo.App.DataStore;
using ToDo.App.Shared;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ToDo.App.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoTasksController : ControllerBase
    {
        private readonly ToDoDbContext db;

        public TodoTasksController(ToDoDbContext db)
        {
            this.db = db;
        }

        [HttpGet]
        public IEnumerable<TodoTask> Get()
        {
            return db.TodoTasks.ToList();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> Get(int id)
        {
            var task = await db.TodoTasks.FirstOrDefaultAsync(t => t.Id == id);

            if (task == null)
            {
                return NotFound("No existe una tarea con ese id.");
            }

            return Ok(task);
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] TodoTask task)
        {
            await db.TodoTasks.AddAsync(task);
            await db.SaveChangesAsync();
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Put([FromBody] TodoTask task)
        {
            db.TodoTasks.Update(task);
            await db.SaveChangesAsync();
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var task = await db.TodoTasks.FirstOrDefaultAsync(t => t.Id == id);

            if(task == null)
            {
                return BadRequest("No existe una tarea con ese id.");
            }

            db.TodoTasks.Remove(task);
            await db.SaveChangesAsync();
            return Ok();
        }
    }
}
