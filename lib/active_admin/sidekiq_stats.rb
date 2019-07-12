module ActiveAdmin
  class SidekiqStats < Arbre::Component
    builder_method :active_admin_sidekiq_stats

    CONTAINER_STYLE = 'display: flex; justify-content: center; align-items: center;'
    VALUE_STYLE = 'display: flex; flex:1; justify-content: center; align-items: center; flex-direction: column; align-self: baseline; text-align: center;'

    def build(attributes = {})
      super(attributes)

      panel('Sidekiq Stats') do
        div(style: CONTAINER_STYLE) do
          begin
            build_fields
          rescue Redis::CannotConnectError
            h1 'Redis Connection Failed'
          end
        end
      end
    end

    private

    def build_fields
      JSON.parse(Sidekiq::Stats.new.to_json).fetch('stats', Hash.new).yield_self do |stats|
        stats.each do |name, value|
          div style: VALUE_STYLE do
            h1 value.round
            span name.titleize
          end
        end
      end
    rescue => e
      div { h3 e.message }
    end
  end
end
