import * as esbuild from 'esbuild'
import rails from 'esbuild-rails'

const config = {
  entryPoints: ['app/javascript/*.js'],
  bundle: true,
  sourcemap: process.env.RAILS_ENV !== 'production',
  minify: process.env.RAILS_ENV === 'production',
  outdir: 'app/assets/builds',
  plugins: [rails()],
  publicPath: '/assets'
}

if (process.argv.includes('--watch')) {
  let context = await esbuild.context({...config, logLevel: 'info'})
  context.watch()
} else {
  esbuild.build(config)
}
