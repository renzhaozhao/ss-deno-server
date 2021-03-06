import { serve } from 'https://deno.land/std/http/server.ts'
import { body, h1, p } from 'https://deno.land/x/ssr/index.ts'
import color from 'https://deno.land/x/colors/index.ts'
import * as log from 'https://deno.land/std/log/mod.ts'

const server = serve({ port: 3000 })
log.info('listen in 3000')

const version = '1.2'

const template = body(
  { style: { color: color.blue } },
  h1({ style: { color: color.red } }, 'Hello Google'),
  p(`Deno Server ${version}`),
);
for await (const req of server) {
  req.respond({
    body: template,
  })
}