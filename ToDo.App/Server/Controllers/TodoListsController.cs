using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ToDo.App.DataStore;
using ToDo.App.Shared;

namespace ToDo.App.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoListsController : ControllerBase
    {
        private readonly ToDoDbContext db;

        public TodoListsController(ToDoDbContext db)
        {
            this.db = db;
        }

        [HttpGet]
        public async Task<IEnumerable<TodoList>> Get()
        {
            return await db.TodoLists
                .Include(t => t.Tasks)
                .ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> Get(int id)
        {
            var list = await db.TodoLists
                  .Include(t => t.Tasks)
                  .FirstOrDefaultAsync(t => t.Id == id);

            if (list == null)
            {
                return NotFound("No existe una lista con ese id.");
            }

            return Ok(list);
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] TodoList todoList)
        {
            await db.TodoLists.AddAsync(todoList);
            await db.SaveChangesAsync();
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Put([FromBody] TodoList todoList)
        {
            db.TodoLists.Update(todoList);
            await db.SaveChangesAsync();
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var list = await db.TodoLists
                .Include(t => t.Tasks)
                .FirstOrDefaultAsync(t => t.Id == id);

            if (list == null)
            {
                return BadRequest("No existe una lista con ese id.");
            }

            db.TodoLists.Remove(list);
            await db.SaveChangesAsync();
            return Ok();
        }
    }
}
