using BookStore.Domain.Interfaces;
using BookStore.Domain.Models;
using BookStore.Infrastructure.Context;
using System.Threading.Tasks;

namespace BookStore.Infrastructure.Repositories
{
    public class CategoryRepository : Repository<Category>, ICategoryRepository
    {

        public CategoryRepository(BookStoreDbContext context) : base(context)
        {
        }

        public override async Task Add(Category entity)
        {
            await base.Add(entity);            
        }

        public override async Task Update(Category entity)
        {
            await base.Update(entity);
        }

        public override async Task Remove(Category entity)
        {
            await base.Remove(entity);
        }
    }
}