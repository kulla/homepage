import Homepage from './index.html'

Bun.serve({
  routes: {
    '/': Homepage,
  },
})
